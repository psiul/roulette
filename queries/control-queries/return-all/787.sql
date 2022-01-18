select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,household_demographics hd,warehouse w
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 545 and ws.ws_hash <= 878 and d.d_hash >= 151 and d.d_hash <= 551 and hd.hd_hash >= 183 and hd.hd_hash <= 933
;
