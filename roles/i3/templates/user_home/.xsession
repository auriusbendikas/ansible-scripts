{% if i3_background_image %}
feh --no-fehbg --conversion-timeout 0 --bg-fill '{{ i3_background_image }}'
{% else %}
hsetroot -solid "{{ i3_background_color }}"
{% endif %}
