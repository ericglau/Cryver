import React from "react";
import "./App.css";
//import "./job";

const axios = require("axios");

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isBack: true,
      file: null,
      isTaskClicked: false,
      isJobClicked: false
    };
    this.onFormSubmit = this.onFormSubmit.bind(this);
    this.onChange = this.onChange.bind(this);
    this.fileUpload = this.fileUpload.bind(this);
    this.job = this.job.bind(this);
    this.goBack = this.goBack.bind(this);
    this.task = this.task.bind(this);
  }
  job() {
    // change code below this line
    this.setState({
      isJobClicked: true,
      isBack: false,
      isTaskClicked: false
    });
    // change code above this line
  }
  task() {
    this.setState({
      isTaskClicked: true,
      isBack: false,
      isJobClicked: false
    });
  }
  goBack() {
    this.setState({
      isBack: true
    });
  }
  onFormSubmit(e) {
    e.preventDefault(); // Stop form submit
    this.fileUpload(this.state.file).then(response => {
      console.log(response.data);
    });
  }
  onChange(e) {
    this.setState({ file: e.target.files[0] });
  }
  fileUpload(file) {
    const url = "http://example.com/file-upload";
    const formData = new FormData();
    formData.append("file", file);
    const config = {
      headers: {
        "content-type": "multipart/form-data"
      }
    };
    return axios(url, formData, config);
  }

  l;

  render() {
    let isBack = this.state.isBack;
    let isTaskClicked = this.state.isTaskClicked;
    let isJobClicked = this.state.isJobClicked;
    let job;
    let firstpage;
    let task;
    if (isBack) {
      firstpage = (
        <div>
          <div>
            <h2>Cryver</h2>
          </div>
          <div className="firstpage">
            <div>
              <h1>Assign jobs</h1>
              <button onClick={this.task}>Make my logo</button>
            </div>
            <div>
              <h1>Search jobs</h1>
              <button onClick={this.job}>Make a logo</button>
            </div>
          </div>
        </div>
      );
    } else if (isJobClicked) {
      job = (
        <div>
          <h2>Cryver</h2>
          <div className="mainpage">
            <button className="back" onClick={this.goBack}>
              GO back
            </button>
            <h1 className="jobtitle">Make Logo for my Company</h1>
            <h3>Checkpoints</h3>
            <div class="flex">
              <ul>
                <li>prototype design</li>
                <li>Motto</li>
                <li>Design 1</li>
                <li>Final Design</li>
              </ul>
              <ul>
                <li>$1</li>
                <li>$2</li>
                <li>$3</li>
                <li>$4</li>
              </ul>
              <ul class="buttons">
                <form onSubmit={this.onFormSubmit}>
                  <input type="file" onChange={this.onChange} />
                  <button className="up" type="submit">
                    Upload
                  </button>
                </form>
                <form onSubmit={this.onFormSubmit}>
                  <input type="file" onChange={this.onChange} />
                  <button className="up" type="submit">
                    Upload
                  </button>
                </form>
                <form onSubmit={this.onFormSubmit}>
                  <input type="file" onChange={this.onChange} />
                  <button className="up" type="submit">
                    Upload
                  </button>
                </form>
                <form onSubmit={this.onFormSubmit}>
                  <input type="file" onChange={this.onChange} />
                  <button className="up" type="submit">
                    Upload
                  </button>
                </form>
              </ul>
            </div>
          </div>
        </div>
      );
    } else if (isTaskClicked) {
      task = (
        <div>
          <h2>Cryver</h2>
          <div className="mainpage">
            <button className="back" onClick={this.goBack}>
              GO back
            </button>
            <h1 className="jobtitle">Make Logo for my Company</h1>
            <h3>Checkpoints</h3>
            <select>
              <option value="0">Select currency:</option>
              <option value="1">USDC</option>
              <option value="1">TCAD</option>
            </select>
            <div class="flex">
              <ul>
                <li>Prototype design</li>
                <li>Motto</li>
                <li>Design 1</li>
                <li>Final Design</li>
              </ul>
              <ul>
                <li>$1</li>
                <li>$2</li>
                <li>$3</li>
                <li>$4</li>
              </ul>
              <ul>
                <li className="submission">
                  <a href="www.gdrive.com">See submission</a>
                </li>
                <li className="submission">
                  <a href="www.gdrive.com">See submission</a>
                </li>
                <li className="submission">
                  <a href="www.gdrive.com">See submission</a>
                </li>
                <li className="submission">
                  <a href="www.gdrive.com">See submission</a>
                </li>
              </ul>
              <ul>
                <li className="approve">Approve</li>
                <li className="approve">Approve</li>
                <li className="approve">Approve</li>
                <li className="approve">Approve</li>
              </ul>
              <ul>
                <li className="reject">Reject</li>
                <li className="reject">Reject</li>
                <li className="reject">Reject</li>
                <li className="reject">Reject</li>
              </ul>
            </div>
          </div>
        </div>
      );
    }

    return (
      <div className="App">
        {firstpage}

        {job}

        {task}
      </div>
    );
  }
}

export default App;
