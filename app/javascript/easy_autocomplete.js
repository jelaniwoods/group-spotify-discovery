import * as easyAutocomplete from "easy-autocomplete"


var options = {
	url: "/users.json",

	getValue: "username",

	list: {
		match: {
			enabled: true
		}
	}
};

$("#theme").easyAutocomplete(options);
