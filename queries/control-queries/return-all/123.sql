select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,household_demographics hd,customer_demographics cd,date_dim d
where ws.ws_order_number = wr.wr_order_number and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and wr.wr_returned_date_sk = d.d_date_sk and hd.hd_hash >= 159 and hd.hd_hash <= 909 and cd.cd_hash >= 244 and cd.cd_hash <= 644 and d.d_hash >= 38 and d.d_hash <= 371
;
