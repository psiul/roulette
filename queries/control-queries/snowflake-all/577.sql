select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,item i,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and hd.hd_hash >= 206 and hd.hd_hash <= 956 and i.i_hash >= 37 and i.i_hash <= 370 and d.d_hash >= 279 and d.d_hash <= 679
;
