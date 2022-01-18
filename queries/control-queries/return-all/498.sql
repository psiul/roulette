select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer_demographics cd,item i,household_demographics hd
where ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and wr.wr_item_sk = i.i_item_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 154 and ws.ws_hash <= 904 and i.i_hash >= 167 and i.i_hash <= 567 and hd.hd_hash >= 143 and hd.hd_hash <= 476
;
