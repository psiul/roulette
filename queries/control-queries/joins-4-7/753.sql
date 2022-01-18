select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 403 and ss.ss_hash <= 736 and i.i_hash >= 117 and i.i_hash <= 867 and hd.hd_hash >= 414 and hd.hd_hash <= 814
;
