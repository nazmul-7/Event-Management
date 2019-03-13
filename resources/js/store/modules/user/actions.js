const updateUser = async (context,data) => {
					  context.commit('USER_UPDATED', data);    
};



export default {
	updateUser,

};
