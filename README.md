<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<!-- <div align="center">
  <a href="https://github.com/sw4d/simple-graphql-client">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a> -->

<h3 align="center">Simple GraphQL Client</h3>

  <p align="left">
    A Ruby class that only relies on core Ruby libraries to allow the user to query a GraphQL service
    <br />
    <a href="https://github.com/sw4d/simple-graphql-client"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/sw4d/simple-graphql-client">View Demo</a>
    ·
    <a href="https://github.com/sw4d/simple-graphql-client/issues">Report Bug</a>
    ·
    <a href="https://github.com/sw4d/simple-graphql-client/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

At the end of the day, GraphQL queries are POST requests with data they want encapsulated in the body of the request going from the client to the GraphQL service. I had some configuration data living on AWS AppSync and wanted to be able to query it via several different ruby services. The idea of having to add a full blown GraphQL client from Apollo or Github seemed excessive so... I wrote this!

It's just for querying data, and really, only for smaller, simple structured data sets. I've mocked up the original code to look like a ruby client that may be pulling book information from a GraphQL service.


<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [GraphQL](https://graphql.org)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

The client.rb file offers an example GraphQL client. The attributes have been written to call out a would-be book querying service, but they could be anything... or the idea of pre-determined attributes could be ripped out altogether.

### Prerequisites

A computer with Ruby. This project was build on 2.6.5 but other 2.0+ versions should work fine.

### Installation

No Gemfile or bundling required. Uses only core ruby libraries

<!-- USAGE EXAMPLES -->
## Usage

The client assumes you're calling out to a GraphQL service that requies a bearer token. It also assumes your returning payload will not require pagination.

```
require 'client'
	Client.new('https://url/to/graphql/service',jwt_token)
	                .getBooks([:ISBN, :Title, :Author, :Price])
  => [{ 'ISBN' => '978-0062305237', 'Title': 'The Perfect Letter: A Novel', 'Author' => 'Chris Harrison', 'Price' => '$10.41'  }]
```
### This Sucks!

When dealing with larger, more complex data sets, or needing to use mutations... It's probably worth checking out more impressive offerings:
* []() graphql-ruby: https://graphql-ruby.org
* []() github version: https://github.com/github/graphql-client


<!-- ROADMAP -->
## Roadmap

- [ ] Add mutation support
- [ ] Research support for copmlex data models

See the [open issues](https://github.com/sw4d/simple-graphql-client/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`) - DON'T FORGET TO RUN/WRITE TESTS!
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Stephen Ford - sw4d@icloud.com

Project Link: [https://github.com/sw4d/simple-graphql-client](https://github.com/sw4d/simple-graphql-client)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []() Hope this peels back the black box some
* []() 2022

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/sw4d/simple-graphql-client.svg?style=for-the-badge
[contributors-url]: https://github.com/sw4d/simple-graphql-client/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/sw4d/simple-graphql-client.svg?style=for-the-badge
[forks-url]: https://github.com/sw4d/simple-graphql-client/network/members
[stars-shield]: https://img.shields.io/github/stars/sw4d/simple-graphql-client.svg?style=for-the-badge
[stars-url]: https://github.com/sw4d/simple-graphql-client/stargazers
[issues-shield]: https://img.shields.io/github/issues/sw4d/simple-graphql-client.svg?style=for-the-badge
[issues-url]: https://github.com/sw4d/simple-graphql-client/issues
[license-shield]: https://img.shields.io/github/license/sw4d/simple-graphql-client.svg?style=for-the-badge
[license-url]: https://github.com/sw4d/simple-graphql-client/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/stephen-ford-8853b011/
[product-screenshot]: images/screenshot.png
