#ifdef CAMERA
	uniform CameraVert camera;
	varying vec3 vCameraPosition;
	varying vec3 vCameraDirection;
	varying float vCameraDistance;
#endif

#ifdef NORMAL
	uniform mat3 normalMatrix;
#endif