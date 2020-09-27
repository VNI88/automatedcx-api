<template>
  <v-app>
    <v-app-bar
      app
      color="white"
      height="100"
      >

      <v-toolbar-title class="font-weight-black headline">
        Automated CX
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-divider
        inset
        vertical
        ></v-divider>
      <a href='https://automatedcx-api-production.herokuapp.com/users/sign_up' style='color: black'>
        <v-btn text>
          Sign Up
        </v-btn>
      </a>
      <v-divider
        inset
        vertical
        ></v-divider>
      <a href='http://automatedcx-api-production.herokuapp.com/users/sign_in' style='color: black'>
        <v-btn text>
          Login
        </v-btn>
      </a>
    </v-app-bar>

    <v-main>
      <section id="hero">
        <v-row no-gutters>
          <v-img
            :min-height="'calc(100vh - ' + $vuetify.application.top + 'px)'"
            src="https://images.unsplash.com/photo-1487017159836-4e23ece2e4cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80"
            >
            <v-theme-provider dark>
              <v-container fill-height>
                <v-row
                  align="center"
                  class="white--text mx-auto"
                  justify="center"
                  >
                  <v-col
                    class="white--text text-center"
                    cols="12"
                    tag="h1"
                    >
                    <span
                      :class="[$vuetify.breakpoint.smAndDown ? 'display-1' : 'display-2']"
                      class="font-weight-light"
                      >
                      WELCOME TO
                    </span>

                    <br>

                    <span
                      :class="[$vuetify.breakpoint.smAndDown ? 'display-3': 'display-4']"
                      class="font-weight-black"
                      >
                      AUTOMATED CX
                    </span>

                  </v-col>

                  <v-btn
                    class="align-self-end"
                    fab
                    outlined
                    @click="$vuetify.goTo('#about-me')"
                    >
                    <v-icon>mdi-chevron-double-down</v-icon>
                  </v-btn>
                </v-row>
              </v-container>
            </v-theme-provider>
          </v-img>
        </v-row>
      </section>

      <section id="about-me">
        <div class="py-12"></div>

        <v-container class="text-center">
          <h2 class="display-2 font-weight-bold mb-3">ABOUT US</h2>

          <v-responsive
            class="mx-auto mb-8"
            width="56"
            >
            <v-divider class="mb-1"></v-divider>

            <v-divider></v-divider>
          </v-responsive>

          <v-responsive
            class="mx-auto title font-weight-light mb-8"
            max-width="720"
            >
            Automated CX is a higly scalable preemptive assistance tool.It makes posible to create and manage event driven systems with automated routines. Also provides detailed charts and reports.
          </v-responsive>

          <v-avatar
            class="elevation-12 mb-12"
            size="128"
            >
            <v-img src="https://www.iconfinder.com/data/icons/study-subject-outline/64/computer-digital-screen-electronic-system-512.png"></v-img>
          </v-avatar>

          <div></div>

          <v-btn
            color="grey"
            href="https://vuetifyjs.com"
            outlined
            large
            >
            <a href="http://automatedcx-api-production.herokuapp.com/api-docs"><span class="grey--text text--darken-1 font-weight-bold">
                Automated CX API DOCS
            </span></a>
          </v-btn>
        </v-container>

        <div class="py-12"></div>
      </section>

      <section
        id="features"
        class="grey lighten-3"
        >
        <div class="py-12"></div>

        <v-container class="text-center">
          <h2 class="display-2 font-weight-bold mb-3">AUTOMATED CX FEATURES</h2>

          <v-responsive
            class="mx-auto mb-12"
            width="56"
            >
            <v-divider class="mb-1"></v-divider>

            <v-divider></v-divider>
          </v-responsive>

          <v-row>
            <v-col
              v-for="({ icon, title, text }, i) in features"
              :key="i"
              cols="12"
              md="4"
              >
              <v-card
                class="py-12 px-4"
                color="grey lighten-5"
                flat
                >
                <v-theme-provider dark>
                  <div>
                    <v-avatar
                      color="black"
                      size="88"
                      >
                      <v-icon
                        large
                        v-text="icon"
                        ></v-icon>
                    </v-avatar>
                  </div>
                </v-theme-provider>

                <v-card-title
                  class="justify-center font-weight-black text-uppercase"
                  v-text="title"
                  ></v-card-title>

                <v-card-text
                  class="subtitle-1"
                  v-text="text"
                  >
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>
        </v-container>

        <div class="py-12"></div>
      </section>

      <section id="stats">
        <v-parallax
          :height="$vuetify.breakpoint.smAndDown ? 700 : 500"
          src="https://images.unsplash.com/photo-1510915228340-29c85a43dcfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
          >
          <v-container fill-height>
            <v-row class="mx-auto">
              <v-col
                v-for="[value, title] of stats"
                :key="title"
                cols="12"
                md="4"
                >
                <div class="text-center">
                  <div
                    class="display-3 font-weight-black mb-4"
                    v-text="value"
                    ></div>

                  <div
                    class="title font-weight-regular text-uppercase"
                    v-text="title"
                    ></div>
                </div>
              </v-col>
            </v-row>
          </v-container>
        </v-parallax>
      </section>

      <section id="blog">
        <div class="py-12"></div>

        <v-container>
          <h2 class="display-2 font-weight-bold mb-3 text-uppercase text-center">Blog</h2>

          <v-responsive
            class="mx-auto mb-12"
            width="56"
            >
            <v-divider class="mb-1"></v-divider>

            <v-divider></v-divider>
          </v-responsive>

          <v-row>
            <v-col
              v-for="({ src, text, title }, i) in articles"
              :key="i"
              cols="12"
              md="4"
              >
              <v-img
                :src="src"
                class="mb-4"
                height="275"
                max-width="100%"
                ></v-img>

              <h3
                class="font-weight-black mb-4 text-uppercase"
                v-text="title"
                ></h3>

              <div
                class="title font-weight-light mb-5"
                v-text="text"
                ></div>

              <v-btn
                class="ml-n4 font-weight-black"
                text
                >
                Continue Reading
              </v-btn>
            </v-col>
          </v-row>
        </v-container>

        <div class="py-12"></div>
      </section>

      <v-sheet
        id="contact"
        color="#333333"
        dark
        tag="section"
        tile
        >
        <div class="py-12"></div>

        <v-container>
          <h2 class="display-2 font-weight-bold mb-3 text-uppercase text-center">Contact Us</h2>

          <v-responsive
            class="mx-auto mb-12"
            width="56"
            >
            <v-divider class="mb-1"></v-divider>

            <v-divider></v-divider>
          </v-responsive>

          <v-theme-provider light>
            <v-row>
              <v-col cols="12">
                <v-text-field
                  flat
                  label="Name*"
                  solo
                  ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  flat
                  label="Email*"
                  solo
                  ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  flat
                  label="Subject*"
                  solo
                  ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-textarea
                  flat
                  label="Message*"
                  solo
                  ></v-textarea>
              </v-col>

              <v-col
                class="mx-auto"
                cols="auto"
                >
                <v-btn
                  color="accent"
                  x-large
                  >
                  Submit
                </v-btn>
              </v-col>
            </v-row>
          </v-theme-provider>
        </v-container>

        <div class="py-12"></div>
      </v-sheet>
    </v-main>

    <v-footer
      class="justify-center"
      color="#292929"
      height="100"
      >
      <div class="title font-weight-light grey--text text--lighten-1 text-center">
        &copy; {{ (new Date()).getFullYear() }} — Automated CX — Made with by John Leider
      </div>
    </v-footer>
  </v-app>
</template>

<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script>
export default {
  data () {
    return {
      articles: [
        {
          src: 'https://stimaenergia.com.br/wp-content/uploads/2019/11/6-big-data-analytics.jpg',
          title: 'Data is where the money is',
          text: 'Every step of your business must be based on data.Every thing gets more clear and precise if based on data.',
        },
        {
          src: 'https://postpressmag.com/wp-content/uploads/automation.jpg',
          title: 'Automation of processes',
          text: 'Increase the speed of your team, automating all the processes.',
        },
        {
          src: 'https://images.unsplash.com/photo-1416339442236-8ceb164046f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1892&q=80',
          title: 'Event Driven System are the future',
          text: 'Event-driven architecture (EDA) is a software architecture paradigm promoting the production, detection, consumption of, and reaction to events.',
        },
      ],
      features: [
        {
          icon: 'mdi-account-group-outline',
          title: 'Third Party Event System',
          text: 'Keep track of all events of your system.Delegate the complexity of this kind of architecture to Automated CX.',
        },
        {
          icon: 'mdi-update',
          title: 'Automated Routines',
          text: 'Based on the events stored in our system, you can create an automated routine for each one of them ending with an personalized action like a menssage to your customer whatsapp, an email and much more.',
        },
        {
          icon: 'mdi-shield-outline',
          title: 'Analystics on hand',
          text: 'For analytical purposes, generate personalized reports in pdf, JSON, XSD.',
        },
      ],
      stats: [
        ['24h', 'Availability for your Routines'],
        ['4', 'Social media fully integrated'],
        ['4', 'Types of Reports']
      ],
    }
  }
}
</script>

