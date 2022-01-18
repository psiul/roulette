select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 11 and ws.ws_hash <= 761 and d.d_hash >= 560 and d.d_hash <= 893 and hd.hd_hash >= 416 and hd.hd_hash <= 816
;
