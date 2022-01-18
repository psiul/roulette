select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 13 and ss.ss_hash <= 763 and i.i_hash >= 551 and i.i_hash <= 884 and d.d_hash >= 442 and d.d_hash <= 842
;
