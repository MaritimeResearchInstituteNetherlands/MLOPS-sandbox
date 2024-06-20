package example

default allow_access = false

allow_access {
	input.classification == "NATO UNCLASSIFIED"
}