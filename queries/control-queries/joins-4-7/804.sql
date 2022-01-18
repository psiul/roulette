select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 332 and ss.ss_hash <= 732 and hd.hd_hash >= 538 and hd.hd_hash <= 871 and i.i_hash >= 175 and i.i_hash <= 925
;
