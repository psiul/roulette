select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 129 and d.d_hash <= 879 and hd.hd_hash >= 371 and hd.hd_hash <= 771 and i.i_hash >= 579 and i.i_hash <= 912
;
