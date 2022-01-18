select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,customer_demographics cd,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 320 and d.d_hash <= 653 and cd.cd_hash >= 269 and cd.cd_hash <= 669 and hd.hd_hash >= 214 and hd.hd_hash <= 964
;
