select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 526 and ss.ss_hash <= 859 and i.i_hash >= 44 and i.i_hash <= 794 and hd.hd_hash >= 428 and hd.hd_hash <= 828
;
