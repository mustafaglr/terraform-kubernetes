provider "google" {
  	project = "your-project"
}

terraform {
	required_providers {
		google = {
	    version = "~> 4.7.0"
		}
  }
}
