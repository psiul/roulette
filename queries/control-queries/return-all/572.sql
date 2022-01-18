select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,customer_demographics cd,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and hd.hd_hash >= 480 and hd.hd_hash <= 813 and i.i_hash >= 181 and i.i_hash <= 931 and d.d_hash >= 532 and d.d_hash <= 932
;
