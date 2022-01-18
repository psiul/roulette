select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,household_demographics hd,date_dim d,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 206 and ws.ws_hash <= 956 and d.d_hash >= 530 and d.d_hash <= 930 and cd.cd_hash >= 261 and cd.cd_hash <= 594
;
