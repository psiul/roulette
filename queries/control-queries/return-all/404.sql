select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,ship_mode sm,household_demographics hd,date_dim d
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and sm.sm_hash >= 89 and sm.sm_hash <= 839 and hd.hd_hash >= 627 and hd.hd_hash <= 960 and d.d_hash >= 569 and d.d_hash <= 969
;
