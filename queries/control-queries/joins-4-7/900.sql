select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 171 and d.d_hash <= 571 and hd.hd_hash >= 76 and hd.hd_hash <= 409 and i.i_hash >= 59 and i.i_hash <= 809
;
