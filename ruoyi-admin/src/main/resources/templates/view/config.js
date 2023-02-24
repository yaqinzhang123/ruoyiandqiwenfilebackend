window.config = {

  ServerAPI: "http://39.96.60.245:8034/api/",//"http://localhost:24640/api/",//
  oidcConfig:
  {
    authority: "https://demo.digitwinology.com:5001/",
    client_id: "js",
    redirect_uri: "http://39.96.60.245:8053/#/Callback",
    response_type: "code",
    scope: "openid profile api1",
    post_logout_redirect_uri: "https://demo.digitwinology.com/index.html",
  },
  AirRoutelineurl:'http://39.96.60.245/data_wire/kml_cjx/line.kml',
  AirRoutepointurl:'http://39.96.60.245/data_wire/kml_cjx/point.kml'
}