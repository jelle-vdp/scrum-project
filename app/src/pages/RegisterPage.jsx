import {useContext, useEffect} from 'react';
import GbayContext from '../context/GbayContext';

import "./RegisterPage.scss";
import React, {useState} from 'react';
import {FaCheck, FaTimes} from 'react-icons/fa';

function RegisterPage() {
    //_________________load context_________________
    const {users} = useContext(GbayContext);

    //_________________states_________________
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [userName, setUserName] = useState({
        value: '',
        error: false,
        tag: <span className='display-alert'></span>
    });
    const [pass, setPass] = useState('');
    const [passConfirm, setPassConfirm] = useState({
        value: '',
        error: false,
        tag: <span className='display-alert'></span>
    });

    //_________________variables_________________

    const errorEmptyPass = <span
        className='error display-alert'><FaTimes/>Please fill in the password field first</span>;
    const errorPassNotMatch = <span className='error display-alert'><FaTimes/>Password doesn't match</span>;
    const passConfirmed = <span className='confirm display-alert'><FaCheck/>Password confirmed</span>;

    //_________________functions_________________
    const handleUserName = (event) => {
        let input = event.target.value;
        setUserName({value: input});
        let errortemp = users.find(user => user.username === input);
        if (input === '') {
            setUserName({value: input,error: false, tag: <span className='display-alert'></span>});
        } else if (errortemp !== undefined) {
            setUserName({
                value: input,
                error: true,
                tag: <span className='error display-alert'><FaTimes/>This username is already taken </span>
            });
        } else {
            setUserName({value: input, tag: <span className='confirm display-alert'><FaCheck/>Good!</span>});
        }
    }

    const handlePass = (event) => {
        let input = event.target.value;
        setPass(input);
        if (passConfirm.value === input && input !== '') {
            setPassConfirm({value: passConfirm.value, error: true ,tag: passConfirmed});
        } else if (passConfirm.value !== input && input !== '' && passConfirm.value !== '') {
            setPassConfirm({value: passConfirm.value, error: true ,tag: errorPassNotMatch});
        } else if (passConfirm.value !== '' && input === '') {
            setPassConfirm({value: passConfirm.value,error: true, tag: errorEmptyPass});
        }
    }

    const handlePassConf = (event) => {
        let input = event.target.value;

        if (input === pass && pass !== '') {
            setPassConfirm({value: input, error:true , tag: passConfirmed});
        } else if (pass === '' && input !== '') {
            setPassConfirm({value: input, error: true ,tag: errorEmptyPass});
        } else if (input === '') {
            setPassConfirm({value: input, error: false ,tag: <span className='display-alert'></span>});
        } else {
            setPassConfirm({value: input, error: true ,tag: errorPassNotMatch});
        }
    }

    //_________________returns_________________
    return (

        <div className="container register-page">
            <h1>Register</h1>
            <div className='register__wrapper'>
                <div className='register__left'>
                    <label htmlFor="firstname">First Name</label>
                    <input type="text" placeholder="First Name" id="firstname"
                           value={firstName} onChange={(event) => setFirstName(event.target.value)}/>

                    <label htmlFor="lastname">Last Name</label>
                    <input type="text" placeholder="Last Name" id="lastname"
                           value={lastName} onChange={(event) => setLastName(event.target.value)}/>

                    <label htmlFor="email">E-mail</label>
                    <input type="email" placeholder="example@email.com" id="email"
                           value={email} onChange={(event) => setFirstName(event.target.value)}/>

                    <label htmlFor="username">Username</label>
                    <input type="text" placeholder="Username" id="username" className={userName.error?'input-with-alert':''}
                           value={userName.value} onChange={handleUserName}/>
                    {userName.tag}


                    <label htmlFor="password">Password</label>
                    <input type="password" placeholder="Password" id="password"
                           value={pass} onChange={handlePass}/>

                    <label htmlFor="confirmpassword">Confirm Password</label>
                    <input type="password" placeholder="Password" id="confirmpassword" className={passConfirm.error?'input-with-alert':''}
                           value={passConfirm.value} onChange={handlePassConf}/>
                    {passConfirm.tag}
                </div>
                <div className='register__right'>
                    <label htmlFor="firstname">First Name</label>
                    <input type="text" placeholder="First Name" id="firstname"
                           value={firstName} onChange={(event) => setFirstName(event.target.value)}/>

                    <label htmlFor="lastname">Last Name</label>
                    <input type="text" placeholder="Last Name" id="lastname"
                           value={lastName} onChange={(event) => setLastName(event.target.value)}/>
                </div>
            </div>
            <button className="login-btn">Register</button>
        </div>

    )
}

export default RegisterPage;