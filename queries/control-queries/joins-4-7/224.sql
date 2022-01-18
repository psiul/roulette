select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 190 and d.d_hash <= 523 and i.i_hash >= 449 and i.i_hash <= 849 and hd.hd_hash >= 169 and hd.hd_hash <= 919
;
