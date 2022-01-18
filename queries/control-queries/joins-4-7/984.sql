select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 385 and ss.ss_hash <= 718 and d.d_hash >= 323 and d.d_hash <= 723 and i.i_hash >= 138 and i.i_hash <= 888
;
