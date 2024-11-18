const { createApp } = Vue;

createApp({
    data() {
        return {
            show: false,
            boardTitle: 'Players',
            players: {
                online: 0,
                data: [] 
            }
        };
    },
    mounted() {
        document.addEventListener('keydown', this.onClose);
        window.addEventListener("message", this.onMessage);
    },
    destroyed() {
        document.removeEventListener('keydown', this.onClose);
        window.removeEventListener("message");
    },
    methods: {
        onClose(event) {
            if (event.key === 'Escape') {
              this.show = false
              fetch(`https://${GetParentResourceName()}/CloseScoreboard`, {})
            }
        },
        onMessage(event) {
            switch (event.data.action) {
                case 'scoreboard':
                    this.show = !!event.data.show

                    if (event.data.title) {
                        this.boardTitle = event.data.title
                    }

                    if (event.data.players) {
                        this.players = {...this.players, data: event.data.players, online: event.data.players.length || 0}
                    }

                    // for testing only
                    if (event.data.showFakeData) {
                        var fake = this.fakeData()
                        this.players = {...this.players, data: [...this.players.data, ...fake], online: this.players.online + fake.length}
                    }
                break;
            }
        },
        getPingColor(ping) {
            if (ping < 50) {
                return 'green';
            } else if (ping < 100) {
                return '#ffbc00';
            } else {
                return '#cf0a0a';
            }
        },
        moneyFormat(money) {
            return `$${parseFloat(money).toLocaleString()}`;
        },
        fakeData() {
            return Array.from({length: 20}, (_, i) => ({
                id: i + 2,
                name: `Player ${i}`,
                ping: Math.floor(Math.random() * 120),
                job: 'Unemployed',
                money: Math.floor(Math.random() * 3000),
            }));
        }
    },
}).mount("#app");
