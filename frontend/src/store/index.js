import { createStore, combineReducers, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import restaurantsReducer from './restaurants';
import reviewsReducer from './reviews';
import sessionReducer from './session';
import userReducer from './usersReducer';
import reservsReducer from './reservs';

const rootReducer = combineReducers({
    // add reducers here
    reviews: reviewsReducer,
    session: sessionReducer,
    restaurants: restaurantsReducer,
    reservs: reservsReducer,
    users: userReducer
});

let enhancer;

if (process.env.NODE_ENV === 'production') {
    enhancer = applyMiddleware(thunk);
} else {
    const logger = require('redux-logger').default;
    const composeEnhancers =
        window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
    enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

const configureStore = (preloadedState) => {
    return createStore(rootReducer, preloadedState, enhancer);
};

export default configureStore;