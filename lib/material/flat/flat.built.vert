#define GLSLIFY 1
#define SHADER_NAME flat material
uniform mat4 uModel;
attribute vec3 aPosition;

#ifdef CAMERA
	struct Camera {
		vec3 position;
		mat4 view;
		mat4 projection;
		mat4 modelView;
		mat3 normal;
	};
#endif

#ifdef CAMERA
	uniform Camera uCamera;
	varying vec3 vCameraPosition;
	varying vec3 vCameraDirection;
	varying float vCameraDistance;
#endif

#ifdef CAMERA
	void applyCamera_0_0(
		inout vec4 result,
		vec3 position,
		mat4 model,
		Camera_0_1 camera,
		inout vec3 cameraPosition,
		inout vec3 cameraDistance,
		inout float cameraDirection
	) {
		vec4 globalPosition = model * vec4( position, 1.0 );
		cameraPosition = camera.position;
		cameraDistance = distance(camera.position, globalPosition.xyz);
		cameraDirection = normalize(camera.position - globalPosition.xyz);
		result = camera.projection * camera.view * globalPosition;
	}
#else
	void applyCamera_0_0(
		inout vec4 result,
		vec3 position,
		mat4 model,
		Camera_0_1 camera,
		inout vec3 cameraPosition,
		inout vec3 cameraDistance,
		inout float cameraDirection
	) { }
#endif

void main() {
	applyCamera_0_0(gl_Position, aPosition, uModel, uCamera, vCameraPosition, vCameraDistance, vCameraDirection);
}
