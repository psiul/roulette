select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 82 and ss.ss_hash <= 832 and hd.hd_hash >= 25 and hd.hd_hash <= 425 and i.i_hash >= 583 and i.i_hash <= 916
;
