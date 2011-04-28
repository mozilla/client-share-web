({
    baseUrl: "../../scripts/",
    paths: {
        "index": "../share/panel/index",
        "jquery": "jqueryStub",
        "widgets": "../share/panel/scripts/widgets"
    },
    name: "index",
    include: ['widgets/AccountPanelLinkedIn', 'widgets/AccountPanelFaceBook',
              'widgets/AccountPanelTwitter', 'ContactsEmail', 'ContactsTwitter',
              'ContactsLinkedIn'],
    exclude: ['jquery', 'require/text'],
    out: './index.js'
})
