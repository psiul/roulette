select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 457 and ss.ss_hash <= 857 and hd.hd_hash >= 495 and hd.hd_hash <= 828 and i.i_hash >= 218 and i.i_hash <= 968
;
