module ApplicationHelper
  require 'rqrcode'

  def qr_code(text)
    qr = RQRCode::QRCode.new(text)
    qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    ).html_safe
  end

  MEMBERS = [
    {
      "f_name": "Name",
      "m_name": "Midlle Name",
      "l_name": "Last Name",
      "email": "mail@mail.com",
      "phone": "80880555",
      "phone_work": "80880555",
      "org": "ORG",
      "position": "Position",
      "site": "url",
    },
  ]
  # vcard_text = "BEGIN:VCARD\nVERSION:3.0\nN:Clark;Jason\nFN:Jason Clark\nORG:MSU Library\nTITLE:Team Leader/Digital Initiatives Librarian [Associate Professor]\nTEL;TYPE=WORK,VOICE:(406) 994-6801\nEMAIL;TYPE=PREF,INTERNET:jaclark@montana.edu\nURL:http://www.jasonclark.info\nREV:20111013T195243Z\nEND:VCARD"
end
