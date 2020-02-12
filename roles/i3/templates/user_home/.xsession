{% if background_image %}
feh --no-fehbg --conversion-timeout 0 --bg-fill '{{ background_image }}'
{% else %}
hsetroot -solid "{{ background_color }}"
{% endif %}
