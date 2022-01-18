select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,item i,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 91 and ws.ws_hash <= 841 and i.i_hash >= 336 and i.i_hash <= 669 and hd.hd_hash >= 346 and hd.hd_hash <= 746
;
