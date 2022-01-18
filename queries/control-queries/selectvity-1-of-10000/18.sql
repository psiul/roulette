select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 106 and ss.ss_hash <= 206 and hd.hd_hash >= 852 and hd.hd_hash <= 902 and i.i_hash >= 366 and i.i_hash <= 386
;
