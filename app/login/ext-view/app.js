Ext.require([
    'Ext.form.*',
    'Ext.data.*'
]);





Ext.onReady(function(){
var formPanel = Ext.create('Ext.form.Panel', {
        renderTo: 'app',
        frame: true,
        title:'Авторизация',
        width: 340,
        bodyPadding: 5,
        waitMsgTarget: true,

        fieldDefaults: {
            labelAlign: 'right',
            labelWidth: 85,
            msgTarget: 'side'
        },

        items: [{
            xtype: 'fieldset',
            title: 'Введите логин и пароль',
            defaultType: 'textfield',
            defaults: {
                width: 280
            },
            items: [{
                    fieldLabel: 'Логин',
                    emptyText: 'Введите логин',
                    name: 'username'
                }, {
                    fieldLabel: 'Пароль',
                    emptyText: 'ВВедите пароль',
                    name: 'password',
                    inputType: 'password',
                }, 
            ]
        }],

        buttons: [ {
            text: 'Submit',
            disabled: true,
            formBind: true,
            handler: function(){
                this.up('form').getForm().submit({
                    url: 'xml-form-errors.xml',
                    submitEmptyText: false,
                    waitMsg: 'Saving Data...'
                });
            }
        },
        {
            text: 'Reset',
            handler: function(){
                formPanel.getForm().reset();
            }
        },
        ]
    });
    
    });
