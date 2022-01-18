select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 374 and ss.ss_hash <= 874 and i.i_hash >= 457 and i.i_hash <= 657
;
