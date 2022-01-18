select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer_demographics cd,household_demographics hd,date_dim d
where ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 94 and ws.ws_hash <= 427 and cd.cd_hash >= 188 and cd.cd_hash <= 938 and hd.hd_hash >= 476 and hd.hd_hash <= 876
;
