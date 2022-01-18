select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,web_returns wr,reason r,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 435 and ws.ws_hash <= 835 and hd.hd_hash >= 28 and hd.hd_hash <= 778 and d.d_hash >= 29 and d.d_hash <= 362
;
