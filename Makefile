.PHONY: build regenerate teaching scaffolds

teaching:
	python3 Scripts/generate_session_teaching.py

scaffolds:
	python3 Scripts/generate_session_scaffolds.py

regenerate: teaching scaffolds

build:
	xcodebuild -project SohaPythonCoach.xcodeproj -scheme SohaPythonCoach \
		-destination 'platform=macOS' \
		CODE_SIGN_IDENTITY="-" CODE_SIGNING_ALLOWED=NO build
