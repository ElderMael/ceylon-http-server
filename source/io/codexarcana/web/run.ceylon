import ceylon.net.http.server {
	newServer,
	equals,
	Endpoint,
	Server,
	Request,
	Response
}

import ceylon.net.http {
	get,
	post
}

"Run the module `io.codexarcana.web`."
shared void run() {
	
	Server server = newServer {
		endpoints = {
			Endpoint {
				path = equals("/");
				acceptMethod = { get };
				void service(Request request, Response response) {
					response.writeString("Say more, more clearly");
				}
			},
			Endpoint {
				path = equals("/");
				acceptMethod = { post };
				service = (Request request, Response response) {
					
					String? name = request.parameter("name");
					
					response.writeString("echo: " + (name else ""));
					
				};
			}
		};
	};
	
	server.start();
}
