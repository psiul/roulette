select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 802 and ss.ss_hash <= 902 and hd.hd_hash >= 377 and hd.hd_hash <= 397 and i.i_hash >= 703 and i.i_hash <= 753
;
