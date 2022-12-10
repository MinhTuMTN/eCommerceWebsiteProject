<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- Content Start -->
    <div class="payment"
      style="
        width: 100vw;
        display: flex;
        justify-content: center;
        margin: 10rem 0rem 5rem 0rem;
      "
    >
      <table
        align="center"
        cellpadding="0"
        cellspacing="0"
        cols="3"
        bgcolor="white"
        class="bordered-left-right"
        style="
          border-left: 10px solid #d7d7d7;
          border-right: 10px solid #d7d7d7;
          max-width: 600px;
          width: 100%;
        "
      >
        <tr height="50">
          <td
            colspan="3"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr align="center">
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            class="text-primary"
            style="
              color: #f16522;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          >
            <img
              src="http://dgtlmrktng.s3.amazonaws.com/go/emails/generic-email-template/tick.png"
              alt="GO"
              width="50"
              style="
                border: 0;
                font-size: 0;
                margin: 0;
                max-width: 100%;
                padding: 0;
              "
            />
          </td>
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr height="17">
          <td
            colspan="3"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr align="center">
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            class="text-primary"
            style="
              color: #f16522;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          >
            <h1
              style="
                color: #f16522;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 30px;
                font-weight: 700;
                line-height: 34px;
                margin-bottom: 0;
                margin-top: 0;
              "
            >
              Payment received
            </h1>
          </td>
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr height="30">
          <td
            colspan="3"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr align="left">
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          >
            <p
              style="
                color: #464646;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 22px;
                margin: 0;
              "
            >
              Hi ${user.firstName} ${user.lastName},
            </p>
          </td>
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr height="10">
          <td
            colspan="3"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr align="left">
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          >
            <p
              style="
                color: #464646;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 22px;
                margin: 0;
              "
            >
              Your transaction was successful!
            </p>
            <br />
            <p
              style="
                color: #464646;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 22px;
                margin: 0;
                text-transform: none;
              "
            >
              <strong>Payment Details:</strong><br />
              Amount: <strong><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${total}" ></fmt:formatNumber>đ</strong> <br />
              Email: ${user.email}<br />
            </p>
            <br />
            <p
              style="
                color: #464646;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 22px;
                margin: 0;
              "
            >
              We advise to keep this email for future
              reference.&nbsp;&nbsp;&nbsp;&nbsp;<br />
            </p>
          </td>
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr height="30">
          <td
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            style="
              border-bottom: 1px solid #d3d1d1;
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr height="30">
          <td
            colspan="3"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
        <tr align="center">
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
          <td
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          >
            <p
              style="
                color: #464646;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 22px;
                margin: 0;
              "
            >
              <strong>Order date: <fmt:formatDate pattern = "dd-MM-yyy hh:mm:ss" 
         value = "${date}" /></strong>
            </p>
            <p
              style="
                color: #464646;
                font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 22px;
                margin: 0;
              "
            ></p>
          </td>
          <td
            width="36"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>

        <tr height="50">
          <td
            colspan="3"
            style="
              color: #464646;
              font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
              font-size: 14px;
              line-height: 16px;
              vertical-align: top;
            "
          ></td>
        </tr>
      </table>
    </div>
    <!-- Content End -->