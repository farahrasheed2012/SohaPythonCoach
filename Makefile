.PHONY: build regenerate teaching scaffolds patch

patch:
	python3 Scripts/patch_hand_authored_lessons.py

teaching:
	python3 Scripts/generate_session_teaching.py

scaffolds:
	python3 Scripts/generate_session_scaffolds.py

regenerate: patch teaching scaffolds

build:
	xcodebuild -project SohaPythonCoach.xcodeproj -scheme SohaPythonCoach \
		-destination 'platform=macOS' \
		CODE_SIGN_IDENTITY="-" CODE_SIGNING_ALLOWED=NO build
