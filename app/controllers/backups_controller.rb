class BackupsController < ApplicationController

  def create_backup
    # Запуск системной команды
    Dir.chdir("/home") # смена директории на домашнюю
    output = `PGPASSWORD=postgres pg_dump -U postgres -d inventory_development > my_backup.sql 2>&1` # запуск команды оболочки и получение ее вывода
    # Проверка кода завершения команды
    if Process.last_status.success? # проверка кода завершения с помощью Process.last_status
      puts "Команда успешно выполнена"
    else
      puts "Команда завершилась с ошибкой. Ответ команды: #{output}"
    end
  end

end
