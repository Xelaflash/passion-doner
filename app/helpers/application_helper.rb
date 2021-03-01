module ApplicationHelper

  def avatar_for(kebab)
    kebab_pic = kebab
    if kebab_pic.photo.attached?
      kebab_default_img = cl_image_tag(kebab.photo.key, width: 140, crop: :fill, class: 'kebab-pic', alt: 'Kebab picture - Passion Döner')
    else
      kebab_default_img = image_tag('kebab_default.png', class: 'kebab-pic', alt: 'Kebab picture - Passion Döner', width: 140)
    end
    kebab_default_img
  end
end
