package main

import (
	"net/http"
)

func (app *application) healthcheckHandler(w http.ResponseWriter, _ *http.Request) {
	data := envelope{
		"status": "available",
		"system info": map[string]string{
			"environment": app.config.env,
			"version":     version,
		},
	}

	err := app.writeJSON(w, http.StatusOK, data, nil)
	if err != nil {
		app.logger.Println(err)
		http.Error(w, "The server encountered a problem and could not process your request",
			http.StatusInternalServerError)
		return
	}
}
