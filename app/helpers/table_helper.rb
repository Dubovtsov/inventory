# app/helpers/table_helper.rb

module TableHelper
  def render_table(collection, *columns)
    content_tag :div, class: 'overflow-x-auto rounded-2xl border border-gray-200', data: {controller: "actions"} do
      content_tag :table, class: 'w-full text-xs text-left text-gray-600' do
        concat(render_table_header(columns))
        concat(render_table_body(collection, columns))
      end
    end
  end

  private

  def render_table_header(columns)
    content_tag :thead, class: 'text-xs text-gray-700 uppercase bg-gray-50' do
      content_tag :tr do
        columns.map { |column| concat(content_tag(:th, I18n.t(column), scope: 'col', class: 'px-6 py-3')) }.join.html_safe
        concat(content_tag(:th))
      end
    end
  end

  def render_table_body(collection, columns)
    content_tag :tbody do
      collection.map do |record|
        content_tag :tr, class: 'bg-white border-t hover:bg-gray-50' do
          columns.map.with_index do |column, index|
            if index == 0
              concat content_tag(:td, link_to(record.send(column), polymorphic_path(record)), class: 'px-6 py-1 font-bold text-gray-950')
            else
              concat(content_tag(:td, record.send(column), class: 'px-6 py-1'))
            end
          end.join.html_safe
          concat(render_table_actions(record))
        end
      end.join.html_safe
    end
  end

  def render_table_actions(record)
    content_tag :td, class: 'px-6 py-1 text-right' do
      dropdown_actions(record)
    end
  end

  def dropdown_actions(record)
    content_tag :div, class: 'relative inline-block text-left' do
      concat(dropdown_toggle)
      concat(dropdown_menu(record))
    end
  end

  def dropdown_toggle
    content_tag :button, class: 'inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 bg-gray-100 rounded-lg hover:bg-gray-50 focus:ring-4 focus:outline-none focus:ring-gray-50', data: { action: 'click->actions#toggle', 'actions-target': 'button' } do
      "..."
    end
  end

  def dropdown_menu(record)
    content_tag :div, class: 'z-10 fade-in-down origin-top-right absolute right-0 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44', data: { 'actions-target': 'actions' } do
      concat(dropdown_menu_items(record))
    end
  end

  def dropdown_menu_items(record)
    content_tag :ul, class: 'text-sm text-gray-700' do
      concat(content_tag(:li, link_to('Редактировать', send("edit_#{record.class.name.downcase}_path", record), data: { turbo_frame: 'modal' }, class: 'block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white transition')))
    end.concat(destroy_menu_item(record))
  end

  def destroy_menu_item(record)
    content_tag :div, class: '' do
      link_to 'Удалить', record, data: { turbo_method: :delete, turbo_frame: '_top', turbo_confirm: 'Are you sure?' }, class: 'block px-4 py-2 text-sm text-gray-700 hover:text-red-700 hover:bg-red-100 transition'
    end
  end
end
