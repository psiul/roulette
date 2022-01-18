select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 545 and ss.ss_hash <= 595 and i.i_hash >= 778 and i.i_hash <= 978 and cd.cd_hash >= 353 and cd.cd_hash <= 453
;
