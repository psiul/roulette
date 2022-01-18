select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 537 and ss.ss_hash <= 937 and hd.hd_hash >= 245 and hd.hd_hash <= 995 and i.i_hash >= 336 and i.i_hash <= 669
;
