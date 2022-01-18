select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 159 and ss.ss_hash <= 559 and hd.hd_hash >= 520 and hd.hd_hash <= 853 and d.d_hash >= 243 and d.d_hash <= 993
;
