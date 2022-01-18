select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 55 and ss.ss_hash <= 805 and hd.hd_hash >= 155 and hd.hd_hash <= 555 and i.i_hash >= 507 and i.i_hash <= 840
;
