select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,web_returns wr,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 193 and ws.ws_hash <= 593 and i.i_hash >= 40 and i.i_hash <= 790 and d.d_hash >= 244 and d.d_hash <= 577
;
